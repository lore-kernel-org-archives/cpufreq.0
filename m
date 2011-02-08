From: J Webster <jw.jwebster@gmail.com>
Subject: Re: CPU throttled down to 800 after 15-30mins
Date: Tue, 08 Feb 2011 12:22:45 +0100
Message-ID: <4D512785.9080709@gmail.com>
References: <4D4DAB6A.6090807@gmail.com> <20110206044123.GB2703@kamineko.org> <201102072055.38707.trenn@suse.de> <4D507895.70204@gmail.com> <4D509E13.6090308@reinelt.co.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Bk1oXnzWTP2pJvhmNpIeWAHasJ9WTIOcboZju6ZpLpA=;
        b=PFco9ZipC5R9uyVj+mY/olXFJiYQFs4pGhyeefGh6VM1WBwrYCHx+7hXejFBMjjUfD
         dQ1FkAl36ExnCHGgpWukk1kf3CbSDcNl/mvm0QSpZeFYBT8lRsMoiXdjDMw9jwJGJV23
         8/IWM9jlLeX+AUsrQFHJotPPc1Imr+3pXDeig=
In-Reply-To: <4D509E13.6090308@reinelt.co.at>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Reinelt <michael@reinelt.co.at>
Cc: Thomas Renninger <trenn@suse.de>, Mattia Dongili <malattia@linux.it>, cpufreq@vger.kernel.org

Thanks.
I have tried both of those options and it is still limited to 800 on 
restarting.
I edited grub 2 as this is the maverick meerkat update.

GRUB_DEFAULT=0
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX="acpi_osi=\"!Windows 2006\""

So, is it acpi or the BIOS or speedstep?
If the above line worked then it would be a BIOS problem but the fact it 
doesn't work, means it must be something else other than the BIOS?


