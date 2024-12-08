<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>آموزش کامل شبکه</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 15px 32px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
        .content {
            margin-top: 20px;
        }
        .pdf-link {
            margin-top: 20px;
            font-size: 16px;
            color: #007bff;
            text-decoration: underline;
            cursor: pointer;
        }
        .quiz-question {
            margin-top: 20px;
        }
        .quiz-buttons {
            margin-top: 10px;
        }
        .progress-bar {
            margin-top: 20px;
            width: 100%;
            background-color: #e0e0e0;
            height: 30px;
        }
        .progress {
            background-color: #4CAF50;
            height: 100%;
            width: 0;
        }
    </style>
</head>
<body>
    <h1>آموزش کامل شبکه</h1>
    <p>موضوعات مورد نظر خود را انتخاب کنید:</p>
    <button class="button" onclick="showLesson('مفاهیم پایه')">مفاهیم پایه</button>
    <button class="button" onclick="showLesson('تجهیزات شبکه')">تجهیزات شبکه</button>
    <button class="button" onclick="showLesson('پروتکل‌ها')">پروتکل‌ها</button>

    <div id="content" class="content"></div>
    <div class="progress-bar">
        <div id="progress" class="progress"></div>
    </div>
    <div id="status"></div>
    <div id="key-points" class="key-points"></div>
    <div id="link-status"></div>

    <!-- لینک فایل PDF -->
    <div id="pdf-links">
        <div class="pdf-link" onclick="openPDF('https://www.example.com/lesson1.pdf')">دانلود PDF مفاهیم پایه</div>
        <div class="pdf-link" onclick="openPDF('https://www.example.com/lesson2.pdf')">دانلود PDF تجهیزات شبکه</div>
        <div class="pdf-link" onclick="openPDF('https://www.example.com/lesson3.pdf')">دانلود PDF پروتکل‌ها</div>
    </div>

    <script>
        const totalLessons = 3;
        let lessonsCompleted = 0;

        function updateProgress() {
            const progress = (lessonsCompleted / totalLessons) * 100;
            document.getElementById("progress").style.width = progress + "%";
            document.getElementById("status").innerText = `پیشرفت شما: ${Math.round(progress)}%`;
            localStorage.setItem('lessonsCompleted', lessonsCompleted);
        }

        function showLesson(topic) {
            const videos = {
                "مفاهیم پایه": {
                    title: "مفاهیم پایه شبکه",
                    description: "در این بخش، به معرفی مفاهیم پایه شبکه شامل IP، MAC Address، Subnet Mask و DNS پرداخته می‌شود.",
                    videoLink: "https://www.youtube.com/watch?v=TPpRmzm9E1g",
                    index: 1,
                    quiz: {
                        question: "IP مخفف چیست؟",
                        options: ["Internet Protocol", "Internal Process", "Internet Provider", "Inter Protocol"],
                        correctAnswer: 0
                    }
                },
                "تجهیزات شبکه": {
                    title: "تجهیزات شبکه",
                    description: "در این بخش، به معرفی تجهیزات اصلی شبکه از جمله روتر، سوئیچ، مودم و کابل‌ها پرداخته می‌شود.",
                    videoLink: "https://www.youtube.com/watch?v=_rUciw5K7L8",
                    index: 2,
                    quiz: {
                        question: "چه تجهیزاتی برای انتقال داده‌ها در شبکه استفاده می‌شود؟",
                        options: ["روتر", "مودم", "سوئیچ", "همه موارد"],
                        correctAnswer: 3
                    }
                },
                "پروتکل‌ها": {
                    title: "پروتکل‌های شبکه",
                    description: "این بخش به معرفی پروتکل‌های مهم شبکه مثل TCP/IP، UDP و HTTP پرداخته می‌شود.",
                    videoLink: "https://www.youtube.com/watch?v=9Wl1Q6y9YzA",
                    index: 3,
                    quiz: {
                        question: "کدام پروتکل برای انتقال داده‌ها با دقت و اطمینان استفاده می‌شود؟",
                        options: ["TCP", "UDP", "HTTP", "FTP"],
                        correctAnswer: 0
                    }
                }
            };

            const videoData = videos[topic];
            document.getElementById("content").innerHTML = `
                <h3>${videoData.title}</h3>
                <p>${videoData.description}</p>
                <video controls>
                    <source src="${videoData.videoLink}" type="video/mp4">
                    مرورگر شما از پخش ویدیو پشتیبانی نمی‌کند.
                </video>
            `;

            if (!localStorage.getItem(`lesson${videoData.index}`)) {
                lessonsCompleted++;
                localStorage.setItem(`lesson${videoData.index}`, true);
            }

            updateProgress();
            showKeyPoints(topic);
            showQuizForm(videoData.quiz);
        }

        function showKeyPoints(topic) {
            const keyPoints = {
                "مفاهیم پایه": [
                    "IP آدرس یک شناسه یکتا برای دستگاه‌ها در شبکه است.",
                    "MAC Address آدرس فیزیکی دستگاه‌ها در شبکه است.",
                    "Subnet Mask برای تقسیم‌بندی شبکه‌ها استفاده می‌شود.",
                    "DNS مسئول تبدیل دامنه‌ها به IP است."
                ],
                "تجهیزات شبکه": [
                    "روتر دستگاهی است که شبکه‌های مختلف را به هم متصل می‌کند.",
                    "سوئیچ برای انتقال داده‌ها بین دستگاه‌ها در یک شبکه محلی استفاده می‌شود.",
                    "مودم برای اتصال شبکه محلی به اینترنت استفاده می‌شود.",
                    "کابل‌های شبکه به انتقال داده‌ها بین تجهیزات مختلف کمک می‌کنند."
                ],
                "پروتکل‌ها": [
                    "TCP پروتکلی است که برای انتقال داده‌ها با دقت و اطمینان استفاده می‌شود.",
                    "UDP پروتکلی است که انتقال سریع داده‌ها را بدون تایید میسر می‌کند.",
                    "HTTP پروتکلی است که برای انتقال صفحات وب استفاده می‌شود."
                ]
            };

            const points = keyPoints[topic];
            let pointsHTML = "<ul>";
            points.forEach(point => {
                pointsHTML += `<li>${point}</li>`;
            });
            pointsHTML += "</ul>";
            document.getElementById("key-points").innerHTML = `
                <h3>یادآوری نکات کلیدی:</h3>
                ${pointsHTML}
            `;
        }

        function showQuizForm(quiz) {
            let quizHTML = `
                <div class="quiz-question">
                    <h3>${quiz.question}</h3>
                    <div class="quiz-buttons">
            `;
            
            quiz.options.forEach((option, index) => {
                quizHTML += `<button class="button" onclick="checkAnswer(${index}, ${quiz.correctAnswer})">${option}</button>`;
            });
            
            quizHTML += "</div></div>";
            document.getElementById("content").innerHTML += quizHTML;
        }

        function checkAnswer(selected, correct) {
            const result = selected === correct ? "پاسخ صحیح!" : "پاسخ نادرست. دوباره تلاش کنید.";
            alert(result);
        }

        function openPDF(pdfUrl) {
            window.open(pdfUrl, '_blank');
        }

        window.onload = () => {
            lessonsCompleted = parseInt(localStorage.getItem('lessonsCompleted') || '0');
            updateProgress();
        };
    </script>
</body>
</html>
