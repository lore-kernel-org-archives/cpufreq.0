From: Jukka Ruohonen <jruohonen@iki.fi>
Subject: Re: Possible bug
Date: Tue, 24 Jul 2012 15:07:42 +0300
Message-ID: <20120724120742.GA3293@marx.bitnet>
References: <WC20120721070908.150028@bellino.com.ar> <201207241401.54084.trenn@suse.de>
Reply-To: jruohonen@iki.fi
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=Hh2GtDbD9Ad/UE9r93CdwUn/TBQApOn3f3qV5pnpqfg=;
        b=Ftg0V499+lZaNzAxw91+OAbxxvVoXym3I/YFKLvpRLXRMbmpjbUBC6GURRk/WvfOKk
         yzqx9/MJUozO6ptWADIa1R7oDeNjEzjxp5PpfTp2LZy+f0oLaC4+M6qLq+PYi3dEDXZD
         nPuy8VkIrYZO8y6bQ7NCO13EfQFTvhWNA1E1u/hZsSzSy1AtM729Y2INdFUaNIIOCo5F
         fbPAUxkCdDoipEiuNeMJPlTxnqmyu1A2HrqKcFfGcI4NtjEQKsBmGsMvWHSrRrOzwVMG
         WZ9MiqyYnTJsxXX9pgPVuC64O5tuqv5cQ5YU80rLzsAujOS8dk6x6SAemARGvA6Rnw0Z
         79cA==
Content-Disposition: inline
In-Reply-To: <201207241401.54084.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Ariel@bellino.com.ar, cpufreq@vger.kernel.org

On Tue, Jul 24, 2012 at 02:01:53PM +0200, Thomas Renninger wrote:
> On Saturday, July 21, 2012 09:09:08 AM Ariel Norberto Bellino wrote:
> > cpufreq-info shows this in my laptop:
> > hardware limits: 800 MHz - 2.53 GHz
> > available frequency steps: *2.53 GHz, 2.53 GHz*, 1.60 GHz, 800 MHz
> This should be a typical and well-known BIOS setup.
> For some reason some BIOSes export the highest frequency twice (or with
> one HZ difference or similar). Linux kernel should be able to handle this
> gracefully. This is nothing to worry about.

I think this is because of the so-called Turbo Boost. I recall at least
couple of Intel specifications or white papers in which it was adviced that
BIOS vendors should report the "turbo state" as the maximum + 1 MHz.

- Jukka.
