From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Pentium M and 2.4. kernel: does not work
Date: Sat, 16 Aug 2003 20:54:05 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030816185405.GB833@brodo.de>
References: <200308160043.30649.g_sauthoff@web.de> <20030815213028.GB1738@brodo.de> <1061019290.18484.14.camel@ixodes.goop.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1061019290.18484.14.camel@ixodes.goop.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Georg Sauthoff <g_sauthoff@web.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Sat, Aug 16, 2003 at 12:34:51AM -0700, Jeremy Fitzhardinge wrote:
> On Fri, 2003-08-15 at 14:30, Dominik Brodowski wrote:
> > Hi Georg,
> > 
> > On Sat, Aug 16, 2003 at 12:43:30AM +0200, Georg Sauthoff wrote:
> > > So I have /proc/sys/cpu/0/, but "cat speed speed-max speed-min" prints only 0 
> > > to the console.
> > That's not a bug, it's a feature. 
> 
> Isn't -pre6 the one which has the problem reading the EST cap bit?  Or
> have you fixed it?

Oh, indeed, it is. Will update the backport RSN.

	Dominik
