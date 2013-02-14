From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/5] Add P state driver for Intel Core Processors
Date: Thu, 14 Feb 2013 09:38:21 +0530
Message-ID: <CAOh2x=nwHbbngQm1PE7SfOLbHs3oMMb74zHXD9721OJzWo1+Tg@mail.gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
	<20130212214949.GA1003@redhat.com>
	<511BC16C.7040807@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=tDrLuTr9xsIUDjn/1uAN0VSmiiKCzshtzF9KYonl6S0=;
        b=aa3h2pBaugcU3rb9ldYKAq5KAbcByAWzL9OhH3MagI67FKr+9eOPwZhe9jhp8WkNkW
         NPBozq/Y2dVfLhVmnRVxoEoSjsZUIQHRCIqta2vUNYdX8PL3wsnKo/1JXjtmW+CZFHy4
         GMQxlTN4hyqDtQVr6kjqhWluDnTaLMMvXyiijNTQNM+M5HPpkJpZ5LR4OrxR9r8jPcFH
         Se8mXE9HPcdcwwA5Ir6dMX351fbMSAVasqbKIYMM5+/cqGnJjigCdG0p/ZUW0FfAjJm8
         LP5VV5dZ7Zy+011ewbKje8had1KGYY/10IWTTGOCVJXzNaxCndW+UgMQVKHp01uFyeyQ
         r3qQ==
In-Reply-To: <511BC16C.7040807@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Wed, Feb 13, 2013 at 10:08 PM, Dirk Brandewie
<dirk.brandewie@gmail.com> wrote:
> For the case where both are built-in the load order works my driver uses
> device_initcall() and acpi_cpufreq uses late_initcall().
>
> For the case where both are a module (which I was sure I tested) you are
> right
> I will have to do something.
>
> For now I propose to make my driver built-in only while I sort out the right
> solution for the module build.  Does this seem reasonable to everyone?

Of-course i am missing something here. Why would anybody want to insert
acpi-cpufreq module when the system supports the pstate driver.

In case they are mutually exclusive, then we can have something like
depends on !ACPI-DRIVER in the kconfig option of pstate driver.
