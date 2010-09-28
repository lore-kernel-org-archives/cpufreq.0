From: Thomas Renninger <trenn@suse.de>
Subject: Re: Rename cpufrequtils into cpupowerutils and provide some basic cpuidle functionality
Date: Tue, 28 Sep 2010 13:06:28 +0200
Message-ID: <201009281306.28835.trenn@suse.de>
References: <1285255810-11252-1-git-send-email-trenn@suse.de> <20100925123710.GA29610@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20100925123710.GA29610@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Saturday 25 September 2010 14:37:10 Dominik Brodowski wrote:
> Hey,
> 
> On Thu, Sep 23, 2010 at 05:30:06PM +0200, Thomas Renninger wrote:
> > here my latest patchset.
> 
> Thanks.
Thank you!

> > If this isn't totally wrong, I'd appreciate if you could
> > push these already (into a separate branch for now?)
> 
> Applied into the "cpupowerutils" branch, and pushed that to
> 
> git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git 
> 
> I split up one patch into two parts, and added two patches on top. Let me
> know what you think about this.
Absolutely fine.

I packaged cpupowerutils, this time with a proper split of library
and devel packages.
I then got these packages:
cpupowerutils
cpupowerutils-bench
libcpupower0
libcpupower-devel
and the obsolete one (should get removed as soon as
no app is linking against -lcpufreq anymore):
libcpufreq0

Whoever wants to have a look or try out these packages,
they can be found here, built against all kind of SUSE distros
(Factory, 11.3, 11.2, 11.1, SLE_11, SLE11_SP1 - x86_64 and i386):
http://software.opensuse.org/search?q=cpupower

I found some minor bugs/enhancements, will post them in a minute.

Comments, suggestions, etc. are very welcome.

Thanks,

        Thomas
