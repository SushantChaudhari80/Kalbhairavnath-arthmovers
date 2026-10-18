package com.sushant.live.service.ai;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

@Service
public class DocumentTextExtractor {

    public String extract(MultipartFile file) throws Exception {
        String name = file.getOriginalFilename();

        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException(
                    "Original filename is required");
        }

        String lower = name.toLowerCase(Locale.ROOT);
        String text;

        if (lower.endsWith(".pdf")) {
            try (var pdf = Loader.loadPDF(file.getBytes())) {
                text = new PDFTextStripper().getText(pdf);
            }
        } else if (lower.endsWith(".txt")) {
            text = new String(
                    file.getBytes(), StandardCharsets.UTF_8);
        } else if (lower.endsWith(".docx")) {
            try (XWPFDocument doc =
                         new XWPFDocument(file.getInputStream())) {
                StringBuilder out = new StringBuilder();

                doc.getParagraphs().forEach(p ->
                        out.append(p.getText()).append('\n'));

                doc.getTables().forEach(table ->
                        table.getRows().forEach(row ->
                                row.getTableCells().forEach(cell ->
                                        out.append(cell.getText())
                                                .append(' '))));

                text = out.toString();
            }
        } else if (lower.endsWith(".xlsx") ||
                   lower.endsWith(".xls")) {

            try (Workbook workbook =
                         WorkbookFactory.create(file.getInputStream())) {
                StringBuilder out = new StringBuilder();
                DataFormatter formatter = new DataFormatter();

                for (Sheet sheet : workbook) {
                    out.append("Sheet: ")
                            .append(sheet.getSheetName())
                            .append('\n');

                    for (Row row : sheet) {
                        for (Cell cell : row) {
                            out.append(formatter.formatCellValue(cell))
                                    .append(" | ");
                        }
                        out.append('\n');
                    }
                }

                text = out.toString();
            }
        } else if (lower.endsWith(".csv")) {
            try (Reader reader = new InputStreamReader(
                    file.getInputStream(), StandardCharsets.UTF_8);
                 CSVParser parser = CSVFormat.DEFAULT
                         .builder()
                         .setIgnoreEmptyLines(true)
                         .get()
                         .parse(reader)) {

                StringBuilder out = new StringBuilder();

                parser.forEach(record -> {
                    for (String value : record) {
                        out.append(value).append(" | ");
                    }
                    out.append('\n');
                });

                text = out.toString();
            }
        } else {
            throw new IllegalArgumentException(
                    "Unsupported format. Allowed: PDF, TXT, DOCX, CSV, XLSX, XLS");
        }

        if (text == null || text.isBlank()) {
            throw new IllegalArgumentException(
                    "No readable text found in the uploaded document");
        }

        return text;
    }
}
