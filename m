From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: /sys/ file access
Date: Mon, 15 Jul 2013 15:04:45 +0530
Message-ID: <CAOh2x=kOtD88pjAVjE-mJnvcvNi6-EG6hLFeRTLa2VAS1CSpvQ@mail.gmail.com>
References: <CAG=jzgD=bKTAbGtTG81XRhyBzNHtr-p-Uyh-2A5eQe0ruKkqsw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Br/SEipcXRXNH7dIkIrGLL4+OVwceCBG+272LHtZPMU=;
        b=Ge7QaVnV09RC5WmjT3UEMLlq+pvraM189soieNu0lzBCtZIFtf2tIV/5iKEIAodEwE
         BrM/nAuaSJyyZ1Ka8aSntHjBbtm2aCojxxXoOpuyPJCY4jfkQHe7AI7BBRJBzTWC2158
         XJvkEIWwoOT71AtFZ3uOmLUu0myoK+1+CZ2PKY5CgRa6s32qXF4p1ReWUm7ketRi7+Pf
         bBokXuzF1pz5spAh5R6lu4TxoUzDPDHrJObuEUdynqnovOsV0uOQv+abHhMXTcoLKmx6
         P2MpB7bPN13t51pxqW/3oGRjKJpCJxmRuJePMD0fgAZaAIL5YeNAuHEjELa+hBWVINTf
         Neog==
In-Reply-To: <CAG=jzgD=bKTAbGtTG81XRhyBzNHtr-p-Uyh-2A5eQe0ruKkqsw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel kernel <kernel@kenobrien.org>
Cc: cpufreq@vger.kernel.org

On Fri, Jul 12, 2013 at 2:25 PM, kernel kernel <kernel@kenobrien.org> wrote:
> I wish to read the file "/sys/devices/system/cpu/cpu0/cpufreq" as an
> unprivileged user. The default permissions on this file are:
>
> -r-------- 1 root root
>
> What is the rationale behind this? All other files in this directory
> are world readable.

Permissions as shown on my Thinkpad with ubuntu 12.04

viresh@blr-linut-001:$ ll /sys/devices/system/cpu/cpu0/
drwxr-xr-x 3 root root    0 Jul 11 17:53 cpufreq/
