From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 1/1] CPUFREQ: fix BUG on cpufreq policy init failure
Date: Tue, 1 Mar 2011 22:32:00 +0100
Message-ID: <201103012232.00666.trenn@suse.de>
References: <1298997670-5866-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1298997670-5866-1-git-send-email-jslaby@suse.cz>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: davej@redhat.com
Cc: Jiri Slaby <jslaby@suse.cz>, cpufreq@vger.kernel.org, jirislaby@gmail.com

On Tuesday 01 March 2011 17:41:10 Jiri Slaby wrote:
> cpufreq_register_driver sets cpufreq_driver to a structure owned (and
> placed) in the caller's memory. If cpufreq policy fails in its ->init
> function, sysdev_driver_register returns nonzero in
> cpufreq_register_driver. Now, cpufreq_register_driver returns an error
> without setting cpufreq_driver back to NULL.
> 
> Usually cpufreq policy modules are unloaded because they propagate the
> error to the module init function and return that.

Looks pretty sane and makes the code much nicer.

Will you pick it up Dave?

       Thomas
