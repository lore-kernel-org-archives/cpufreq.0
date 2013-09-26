From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: [PATCH -v2] cpufreq: skip loading acpi_cpufreq after intel_pstate
Date: Thu, 26 Sep 2013 08:41:18 -0700
Message-ID: <CAE9FiQUtZAe2Y1CUNKYRsSV3UM4g2N67EP5cAEcX7C786bXcaQ@mail.gmail.com>
References: <1379699036-7380-1-git-send-email-yinghai@kernel.org>
	<CAE9FiQV+K9QSEiRMA8BtqC8k2OHm4aZWODNL+vgfFmpsuBfzQg@mail.gmail.com>
	<CAKohpom3SkbGk-XgjXXFWZw2asAkxaM=XBYebWHxKQFN_WoXBw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=yhN/Q3+hha2TpIWVDpCDhh4LuccSQcT/b1sqZ0qkY6Y=;
        b=HoQXG9pP9oQjhJdGBAxma/YOLpaNOReB0+000haeogeCnJolNZJbcIun3PNurY740l
         hH4g3pBqKqsiARKhi0ci1wNnXjlRV8hHKYe5ZoQjNkgPd9QE9BPAnFRj6TURJM+On/Ji
         BQGDuBV55AQ29Qp/nieZJR8awf+rlT4lN0rNGzqozXOD+EQJtznc/Yd3BxoKguaRG9GF
         q8aB/Ikm5qexvoiUcSAZ4EJGTvXeUUOmh+ZhQjXF6bxd/zi+xDKPLWf9sMps2wpm9xdH
         l6zxh2WrzmH3RTSQiNvz8GmvB273GgxQQrFFgRot1tj+kUwRV68WAtf0k6E38vFBE4uX
         QWig==
In-Reply-To: <CAKohpom3SkbGk-XgjXXFWZw2asAkxaM=XBYebWHxKQFN_WoXBw@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Sep 25, 2013 at 10:40 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 26 September 2013 10:47, Yinghai Lu <yinghai@kernel.org> wrote:
>> can you put this one in acpi tree?
>
> Its already applied in Rafael's linux-next branch.. Do you want something
> else?

sorry, I missed that.

I still had that in local patches directory, but looks like quilt is
not smart enough and did not report that patch is already applied.

Thanks

Yinghai
