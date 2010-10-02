From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 2/3] cpupowerutils: Use sbindir for binaries that need
 root privileges
Date: Sat, 2 Oct 2010 12:35:56 +0200
Message-ID: <20101002103556.GB2002@comet.dominikbrodowski.net>
References: <201009281306.28835.trenn@suse.de>
 <1285672408-26839-3-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1285672408-26839-3-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

On Tue, Sep 28, 2010 at 01:13:27PM +0200, Thomas Renninger wrote:
> cpufreq-aperf:
>    - Must be run as root or it exits with a related error message.
>    - It should not be used by any scripts
> 
> cpufreq-set:
> I am not sure whether above is true for cpufreq-set as well.
> I expect it always must be called as root and thus should be in sbindir.

Applied, thanks.

	Dominik
