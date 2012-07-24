From: Thomas Renninger <trenn@suse.de>
Subject: Re: Possible bug
Date: Tue, 24 Jul 2012 14:01:53 +0200
Message-ID: <201207241401.54084.trenn@suse.de>
References: <WC20120721070908.150028@bellino.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <WC20120721070908.150028@bellino.com.ar>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Ariel@bellino.com.ar
Cc: cpufreq@vger.kernel.org

On Saturday, July 21, 2012 09:09:08 AM Ariel Norberto Bellino wrote:
> Hi.
> 
> I'm not sure if this is a bug, but I couldn't find any useful information,
> so here I write. Hope it's not a problem.
> 
> cpufreq-info shows this in my laptop:
> hardware limits: 800 MHz - 2.53 GHz
> available frequency steps: *2.53 GHz, 2.53 GHz*, 1.60 GHz, 800 MHz
This should be a typical and well-known BIOS setup.
For some reason some BIOSes export the highest frequency twice (or with
one HZ difference or similar). Linux kernel should be able to handle this
gracefully. This is nothing to worry about.

  Thomas
