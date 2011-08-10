From: Thomas Renninger <trenn@suse.de>
Subject: Re: [cpupower] RFC: support "cpupower subcommand [ -c cpulist ]"
Date: Wed, 10 Aug 2011 09:00:11 +0200
Message-ID: <201108100900.12243.trenn@suse.de>
References: <20110806151829.GA8559@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110806151829.GA8559@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Saturday 06 August 2011 17:18:29 Dominik Brodowski wrote:
> Currently, one needs to set the cpulist _before_ the subcommand, i.e.
> 
> 	cpupower [ -c cpulist ] subcommand [ARGS]
> 
> However, cpufrequtils used to allow to have "-c CPU" as a parameter to
> cpufreq-set(1) or cpufreq-info(1). Therefore, it may make sense to also
> support
Why exactly would this be an enhancement?
To be able to create an alias easier?

> 	cpupower subcommand [ARGS#1] [ -c cpulist ] [ARGS#2]
> 
> The attached patch attempts to do so, but I'm not yet 100% convinced myself
> that a) we should do this at all, and b) that I chose the right approach.
I'd not try to do that.

   Thomas
