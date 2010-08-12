From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: proposed sysfs semantic change.
Date: Thu, 12 Aug 2010 11:46:53 +0200
Message-ID: <20100812094653.GA29406@isilmar-3.linta.de>
References: <20100811215443.GA28343@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100811215443.GA28343@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

Hey,

On Wed, Aug 11, 2010 at 05:54:43PM -0400, Dave Jones wrote:
> Users with dual/quad core systems can currently set individual cores to
> have different governors (and drivers!), which doesn't really make a lot
> of sense.
> 
> I'm thinking of changing things so scaling_governor file for the 2nd/3rd/4th etc
> cores is a symlink to the same file in cpu0/
> So a write to one file will automatically set things on all related cores within
> the same package.
> 
> For completeness we could also symlink related_cpus and driver.
> 
> thoughts ?

good idea.

Best,
	Doinik
