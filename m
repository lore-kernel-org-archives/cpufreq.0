From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: cpufreq-info
Date: Tue, 2 Sep 2014 10:24:21 +0530
Message-ID: <CAOh2x=kWjNZo5_xaSqoAhhFY6Dgbbs5qhwM8tHGUHdjD1hhO+g@mail.gmail.com>
References: <5404D70B.4000407@soaringmeteo.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=ZJnult5Vi1fDGW+qiFj+3tS91NOb4ncJQzOj5pVUogM=;
        b=V0/F1yue1oapQj5ZaQkBu+nvnKKOTILkFo4lyzOEMppLY9xRZQ8KhI2kd6+VXr22/V
         1YD1m6odsZWeBU+48U0RzVIMHzqiS3MegO1cHIcOoPCT0QUAMsXcm2SAYr+6cgGRzdWq
         LuaXpJTxtYRsr/fGO5aZu7ZQ8ZDO9mtvALuIdiGW7Zdbubsk32ekiiD6ZAFK/zjxVDi5
         uJEuztUmKv+x+sLLrylwiE+7ox0D5O0B6Fx1kX3zW5GZjRq7f4iXigJ7/qH21mczvYYb
         6BiAfaHkIE2oksMaz8oMUMM6sNcN3eWQjqCMnd/6/NEjNdbC/EcQv9s1IwDTFRF0lurA
         KaxA==
In-Reply-To: <5404D70B.4000407@soaringmeteo.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Oberson <jo@soaringmeteo.ch>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Tue, Sep 2, 2014 at 1:58 AM, Jean Oberson <jo@soaringmeteo.ch> wrote:
>  Hello
>
> I am working on a dedicated dual core Intel ATOM serveur on ubuntu
>
> uname -a
>
> 3.2.0-23-generic #36-Ubuntu SMP Tue Apr 10 20:39:51 UTC 2012 x86_64 x86_64
> x86_64 GNU/Linux
>
> Results :
>
> $>cpufreq-info
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
> analyzing CPU 1:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
> analyzing CPU 2:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
> analyzing CPU 3:
>   no or unknown cpufreq driver is active on this CPU
>   maximum transition latency: 4294.55 ms.
>
> Helps please

Bootlogs might be interesting to see what went wrong.
