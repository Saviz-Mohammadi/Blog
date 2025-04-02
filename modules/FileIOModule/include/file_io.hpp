#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QUrl>
#include <QString>

class FileIO : public QObject
{
    Q_OBJECT

public:
    explicit FileIO(QObject *parent = nullptr);
    ~FileIO();

private:

signals:

public:
    Q_INVOKABLE QString readFile(const QUrl &fileUrl);
    Q_INVOKABLE QString readFile(const QString &filePath);

    // Getters:
public:

    // Setters:
public:

};

#endif // FILEIO_H
