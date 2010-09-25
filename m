From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Rename cpufrequtils into cpupowerutils and provide some basic
 cpuidle functionality
Date: Sat, 25 Sep 2010 14:37:10 +0200
Message-ID: <20100925123710.GA29610@comet.dominikbrodowski.net>
References: <1285255810-11252-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1285255810-11252-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Hey,

On Thu, Sep 23, 2010 at 05:30:06PM +0200, Thomas Renninger wrote:
> here my latest patchset.

Thanks.

> If this isn't totally wrong, I'd appreciate if you could
> push these already (into a separate branch for now?)

Applied into the "cpupowerutils" branch, and pushed that to

git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git 

I split up one patch into two parts, and added two patches on top. Let me
know what you think about this.

> I do not want to pollute other lists for now.
> If you accept this and I did some further testing, packaging,
> cleanup, etc., I'd like to announce this work on some more lists
> (lesswatts, linux-pm, acpi, ...).

Sounds good.

Best,
	Dominik
