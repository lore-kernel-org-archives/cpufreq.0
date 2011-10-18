From: sabrina chang <sabrinaytchang@gmail.com>
Subject: question about scailing CPU frequency
Date: Tue, 18 Oct 2011 10:30:01 +0800
Message-ID: <CABgotT+TnOikBe5jwsy_+bPPto42OYS5Mq5=wpzAmaKmv+4raw@mail.gmail.com>
References: <CABgotTJO-_PppTW_1cqmsgV-0VQcK=BdQ76jXWg-M2gTxNOVgA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=8NcNCMf1+UQdM/9AiqonUX5fT5RimPaSdrVzkho74kQ=;
        b=NVieObcHDznSy8gPriAxTDX57gmVUj55i5CMc7nUGFEXOMjEWvpa+dv1Bt2xuIvDqK
         5d8tH3qa1i6aEH8TQMFaXV8prfWm7aOD2nnn39wYW7wfxndVuJMdsdyKfd9/Jz3p+C9R
         m9WodYp4IWkGqcZwvjjRdWxVBkI6H8C5r/kso=
In-Reply-To: <CABgotTJO-_PppTW_1cqmsgV-0VQcK=BdQ76jXWg-M2gTxNOVgA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

hello,
I have some questions about scailing CPU frequency.
I want to create an environment with 1 higher CPU frequency and 3
lower CPU frequency on Fedora system(linux kernel 2.6.32) with
acpi-cpufreq driver (Intel Core i7-920 Processor).
***********************************************************************=
*****************************
this is the cpufreq-info report:
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
=A0 driver: acpi-cpufreq
=A0 CPUs which run at the same hardware frequency: 0 1 2 3
=A0 CPUs which need to have their frequency coordinated by software: 0
=A0 maximum transition latency: 10.0 us.
=A0 hardware limits: 1.60 GHz - 2.67 GHz
=A0 available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz,
2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
=A0 available cpufreq governors: ondemand, userspace, performance
=A0 current policy: frequency should be within 1.60 GHz and 2.67 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "userspace" may decide=
 which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
=A0 current CPU frequency is 2.67 GHz (asserted by call to hardware).
analyzing CPU 1:
=A0 driver: acpi-cpufreq
=A0 CPUs which run at the same hardware frequency: 0 1 2 3
=A0 CPUs which need to have their frequency coordinated by software: 1
=A0 maximum transition latency: 10.0 us.
=A0 hardware limits: 1.60 GHz - 2.67 GHz
=A0 available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz,
2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
=A0 available cpufreq governors: ondemand, userspace, performance
=A0 current policy: frequency should be within 1.60 GHz and 2.67 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "userspace" may decide=
 which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
=A0 current CPU frequency is 2.67 GHz (asserted by call to hardware).
analyzing CPU 2:
=A0 driver: acpi-cpufreq
=A0 CPUs which run at the same hardware frequency: 0 1 2 3
=A0 CPUs which need to have their frequency coordinated by software: 2
=A0 maximum transition latency: 10.0 us.
=A0 hardware limits: 1.60 GHz - 2.67 GHz
=A0 available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz,
2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
=A0 available cpufreq governors: ondemand, userspace, performance
=A0 current policy: frequency should be within 1.60 GHz and 2.67 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "userspace" may decide=
 which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
=A0 current CPU frequency is 2.67 GHz (asserted by call to hardware).
analyzing CPU 3:
=A0 driver: acpi-cpufreq
=A0 CPUs which run at the same hardware frequency: 0 1 2 3
=A0 CPUs which need to have their frequency coordinated by software: 3
=A0 maximum transition latency: 10.0 us.
=A0 hardware limits: 1.60 GHz - 2.67 GHz
=A0 available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz,
2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
=A0 available cpufreq governors: ondemand, userspace, performance
=A0 current policy: frequency should be within 1.60 GHz and 2.67 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "userspace" may decide=
 which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
=A0 current CPU frequency is 2.67 GHz (asserted by call to hardware).
***********************************************************************=
*****************************
When I want to create the environment I want, the lower freq. always
sync with the higher freq.
It means that as long as one CPU frequency is higher, the rest lower
freq will adjust to the higher freq. even I set them to the lower
freq.
=46rom the cpufreq-info report, it seems they are using=A0hardware
coordination, not software coordination.
I saw some other articles talking about we can choose which coordinatio=
n to use.
Do you know how to setting to=A0software coordination, even if the powe=
r
do not save any consumption is ok.
I want the different speed of CPU for experiment.
Thanks for your listening!
BR,
Sabrina
