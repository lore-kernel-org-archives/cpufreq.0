From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [RFC PATCH] kbuild: Build linux-tools package with 'make deb-pkg'
Date: Wed, 10 Apr 2013 09:57:24 +0200
Message-ID: <20130410075724.GK6858@8bytes.org>
References: <CA+icZUU=SdiaPBqabf0miOM1Arsc=PjHQbY4GpaDiM4=Fbp73A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUU=SdiaPBqabf0miOM1Arsc=PjHQbY4GpaDiM4=Fbp73A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-kernel@lists.debian.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM List <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

Hi Sedat,

On Wed, Apr 10, 2013 at 09:41:55AM +0200, Sedat Dilek wrote:
> [ CCing some involved maintainers and MLs ]
> 
> Hi Joerg,
> 
> what is the status of your proposal patch?
> Is this [1] the last version you posted?

Yes, this looks like the latest version. As far as I remember I didn't
get feedback on it and had not time to work further on the patch.

There are also problems with building a generic linux-tools package. One
is that the packages need to look differently for Debian and Ubuntu. The
other problem is that it may break automated x-compile builds.


	Joerg


