From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Fehler bei cpufreq-info
Date: Fri, 29 Mar 2013 19:17:03 +0530
Message-ID: <CAOh2x=kg5jT4eux6fP6_kNP0CwWQO9uNrZCQ1f0qoQF+rKeUZw@mail.gmail.com>
References: <51558EDC.2040503@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OOiFJMMKDDrGOks9ggvly5ku466OCJbygu9FphX8d00=;
        b=Zg3P9zFs+awhQopZMkgW1/jHor6JC6WUW0qdZcQY1/udKPzTFoMnrjVGPZEnNiPCjA
         bdFoJZu7Vnm6xaDh7nGcuWzw25+J5Xdg6LDPhuGKebCuNjP9DObY8EJ9YLlSgYTeydSo
         RbRt9cywjcv3hNIADL5tMpAjjtamXx0BtMF/VZh3mGk54jaFWPTVGZObDaNJTaUOiI1b
         mAUarsXLjQldLKjv8To0zdvJIP1fc1R7AauPBkPkfPhcW0rNdPj+hmB1MQy92+jGLvF9
         JvlU3ip96sRNOhDIaaweszU/paSAZgXkXrStPDXCnxZRi/WY6ZyXWjFbpNKzFJMY+1/j
         1sqw==
In-Reply-To: <51558EDC.2040503@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rainer Maier <RaMaier@gmx.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

2013/3/29 Rainer Maier <RaMaier@gmx.de>:
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
> analysiere CPU 0:
>   Treiber: p4-clockmod
>   Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0
>   Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0
>   Maximale Dauer eines Taktfrequenzwechsels: 10.00 ms.
>   Hardwarebedingte Grenzen der Taktfrequenz: 317 MHz - 2.53 GHz
>   m=F6gliche Taktfrequenzen: 317 MHz, 633 MHz, 950 MHz, 1.27 GHz, 1.5=
8 GHz,
> 1.90 GHz, 2.22 GHz, 2.53 GHz
>   m=F6gliche Regler: userspace, powersave, conservative, ondemand, pe=
rformance
>   momentane Taktik: die Frequenz soll innerhalb 317 MHz und 2.53 GHz.
>                     liegen. Der Regler "performance" kann frei entsch=
eiden,
>                     welche Taktfrequenz innerhalb dieser Grenze verwe=
ndet
> wird.
>   momentane Taktfrequenz ist 2.53 GHz  (verifiziert durch Nachfrage b=
ei der
> Hardware).
>   Statistik:317 MHz:0,00%, 633 MHz:0,00%, 950 MHz:0,00%, 1.27 GHz:0,0=
0%,
> 1.58 GHz:0,00%, 1.90 GHz:0,00%, 2.22 GHz:0,00%, 2.53 GHz:100,00%

What's the context of this mail? And why is it written in German?
