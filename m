From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: NULL pointer dereference
Date: Mon, 20 May 2013 15:16:56 +0530
Message-ID: <CAOh2x=ms1j1j=qV2zkd_KQiwLGirPvwQkV=7b=gnbBR34TxKng@mail.gmail.com>
References: <20130520070350.GA741@hobo.wolfson.cam.ac.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=O2xEcdDhsMAycuZZgJlh6p0UZHYjNofA3FvVi9gO1AU=;
        b=cOvdvXz88YH+eNiFl9WlncbY8BuQUEd2vbMeLAKDxHwOTl9BerJtPr+wIZhRoMWFmO
         B7A16nRetY/aUd/iZzxgt7M1FPMeiEW+qOSuLPRCJ6qhfvE1VEIE0Ycmx5uLHKmVbDjP
         kCoF6II1tJM08C08eFkRcH3QvlmKT7Sq6n4A8cSWoF4mg8pvY0vVXzE0QRzUvC4MtiyS
         afB7X0aH9RAXtR4yUTzEInb6V3QoVaOCvgDrZ2dJ7InGUr5dBcSpwxcu0S7c44vn3aEz
         11kzDWxioyQW69JAzQPxbj4uu9K8WXENE14SBED7eACQyIdiVwomEYGhQ49VnoxvrCkM
         kIIw==
In-Reply-To: <20130520070350.GA741@hobo.wolfson.cam.ac.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ross Lagerwall <rosslagerwall@gmail.com>
Cc: cpufreq@vger.kernel.org

On Mon, May 20, 2013 at 12:33 PM, Ross Lagerwall
<rosslagerwall@gmail.com> wrote:
> Booting 3.10-rc1, I got a warning, then a stack dump then a NULL pointer
> dereference all apparently in cpufreq code:
> WARNING: at drivers/cpufreq/cpufreq_governor.c:251
> cpufreq_governor_dbs+0x61e/0x680()
> ...
>
> It seems to have happened during the initialization of udev.
> This has only happened once out of several boots.
>
> I have attached the boot log for completeness. I'm not sure if any other
> information is needed.

Hi Ross,

Some known bugs are fixed during 3.10-rc2. Can you please check that to
see if it works for you?

They should already be there in linus's master branch.

--
viresh
