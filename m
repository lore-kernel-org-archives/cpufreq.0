From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [BUG 3.12.rc4] Oops: unable to handle kernel paging request
 during shutdown
Date: Fri, 25 Oct 2013 11:07:40 +0100
Message-ID: <CA+55aFy3dFGsN_Ckaq8egmaEi_JV_qAVOjR6h3gojyBWwA-jpA@mail.gmail.com>
References: <525BD08C.2080101@t-online.de>
	<2582195.phiuskXt0x@vostro.rjw.lan>
	<1483174.NsuFf8aJk6@vostro.rjw.lan>
	<3005031.0yf0g1BPEE@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=c0RCv2Pgig3gXWz7lzbosqskPxnjIRV7qFCG3NnBmdU=;
        b=TqgjCHtlZ/+NaSjLgAh7OXuXh5jCNSXyORSyHAOZnnUk9twTjbFpzTwdhPUb5iYuwO
         L0XdIm0K+LjF+90zX4Pv4LC/8Nl2HzgTShDSBgzuB/IcMomwAtliHaU6NPIMn+ba4LZE
         q/OcATTPH2E55Fu6Hi/2d2mVSNxAJseZwBoQ2D3Q5mQ5PdWHd7GOeVTyhZrMKRjuolwk
         YbOeMKhkUomonrJGaCxN/Ecg9R2xZGNR0iMtX9yAp7kbPQXnVnHJ/Dpo6evrwYvixiKG
         PzppT0wEy/Y/EGpI4fJYTSY5IxHuLqmfTTE/XBXq79PmZRNjekI1Mk1wWgI9vYygagpC
         SATg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=c0RCv2Pgig3gXWz7lzbosqskPxnjIRV7qFCG3NnBmdU=;
        b=VxQb/vkV0OPxvU0tPjgTk2+czAbow0j7gysWYxFVLY6OjbA9gddy4rrlJVDfIbrUs5
         Ljgxhynf19sZXN4bBVVauOkKrKptJQNlM1ayBmKWQN1pqrphXv70AQ/s/jOZqQa52P+4
         3Yz7fK55FSLGUrmIvq7BLWCfEd48DCyBZwKIw=
In-Reply-To: <3005031.0yf0g1BPEE@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Knut Petersen <Knut_Petersen@t-online.de>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, =?UTF-8?B?RnLDqWTDqXJpYyBXZWlzYmVja2Vy?= <fweisbec@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Fri, Oct 25, 2013 at 11:10 AM, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> On Friday, October 25, 2013 11:51:40 AM Rafael J. Wysocki wrote:
>
>         /* don't keep reloading if cpufreq_driver exists */
>         if (cpufreq_get_current_driver())
> -               return 0;
> +               return -EEXIST;
>
>         if (acpi_disabled)
> -               return 0;
> +               return -ENODEV;
>
>         pr_debug("acpi_cpufreq_init\n");

I think:

 - EBUSY is a better error return than EEXIST here/

  - do the ENODEV case first, because claiming something is busy when
you couldn't have used it anyway is kind of stupid)

but yeah, this looks like the right thing. Let's make sure there
aren't any annoying error messages etc printed out as a result of
this, though.

                  Linus
