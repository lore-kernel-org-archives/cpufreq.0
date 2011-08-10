From: Thomas Renninger <trenn@suse.de>
Subject: Re: [cpupower] RFC: use man(1) when calling "cpupower help subcommand"
Date: Wed, 10 Aug 2011 08:53:53 +0200
Message-ID: <201108100853.54106.trenn@suse.de>
References: <20110806161143.GA12443@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110806161143.GA12443@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Saturday 06 August 2011 18:11:43 Dominik Brodowski wrote:
> Instead of printing something non-formatted to stdout, call
> man(1) to show the man page for the proper subcommand.

Nice!
  
> -extern void set_help(void);
> -extern void info_help(void);
> -extern void freq_set_help(void);
> -extern void freq_info_help(void);
> -extern void idle_info_help(void);
> -extern void monitor_help(void);
I wonder whether these are still needed then.
If they can get removed translations, maintenance overhead
(adjusting 2 places when adding a parameter) and the size of the 
binaries could get reduced.

Not tested yet, but I'll give it a try later.

   Thomas
