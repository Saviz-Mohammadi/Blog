#ifdef QT_QML_DEBUG
#include <QDebug>
#endif

#include <QFile>
#include <QTextStream>
#include "file_io.hpp"

FileIO::FileIO(QObject *parent) : QObject(parent)
{
}

FileIO::~FileIO()
{
}

QString FileIO::readFile(const QUrl &fileUrl)
{
    QString filePath;

    if (fileUrl.isLocalFile())
    {
        filePath = fileUrl.toLocalFile();
    }

    return(readFile(filePath));
}

QString FileIO::readFile(const QString &filePath)
{
    QFile file(filePath);

    if (!file.exists())
    {
#ifdef QT_DEBUG
        qDebug() << "File does not exist:" << filePath;
#endif
        return QString();
    }

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
#ifdef QT_DEBUG
        qDebug() << "Could not open file:" << filePath;
#endif
        return QString();
    }

    QTextStream in(&file);
    QString content = in.readAll();

    file.close();

    return(content);
}
