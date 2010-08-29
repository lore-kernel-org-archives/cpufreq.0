From: Tiago Marques <tiagomnm@gmail.com>
Subject: Re: Speedstep on Celeron SU2300
Date: Sun, 29 Aug 2010 05:54:44 +0100
Message-ID: <AANLkTimq+M43QmZsW_FQX7=djANa=WRbqpk0hA6HVoFy@mail.gmail.com>
References: <AANLkTiktJ5Xgnsmq2je7T3Yc5Sf53Bu8vWMM1XT1V_vm@mail.gmail.com> <AANLkTikhSK8ep1y7y8NJpJamGm0bhpqkWscYEx-era0h@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type;
        bh=iEa/i73iCGrgk635ArlBpkiHTUwbY6qiXIFpC4mbtDk=;
        b=ZuiRXhzGdQkbW2uoV7BRtYUKg3M1qbslIkqExYe3jyBs+VfV5q/vjhRS5N3KP4deFw
         ZzMNIjVX0wVZPZP/Icbq+EvBh1TZfvpercPmRYneCZkl3e0XHLfDa8vuc8l/1FyVvDv6
         s2157gU5A+WveJs1SaDHOsA5tYFzpyqrHQo14=
In-Reply-To: <AANLkTikhSK8ep1y7y8NJpJamGm0bhpqkWscYEx-era0h@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,
I'm having a problem with this processor not having frequency steps
and apparently only voltage steps. I find it very strange but that's
what Intel's documentation suggests. I can't load acpi-cpufreq because
it doesn't find any device and battery life in linux is suffering
around 20% less due to this. I have confirmed that the CPU supports
Speedstep, just this very strange variation.
Can I somehow help with this to get it fixed? Who are the current maintainers?
Thanks,
Tiago
