From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Fri, 15 Aug 2003 21:40:32 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030815194032.GB2759@brodo.de>
References: <3F3CB378.1000607@basmevissen.nl> <20030815154156.GA1029@brodo.de> <200308151853.30238.g_sauthoff@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308151853.30238.g_sauthoff@web.de>
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
To: Georg Sauthoff <g_sauthoff@web.de>
Cc: Cpufreq@www.linux.org.uk

On Fri, Aug 15, 2003 at 06:53:30PM +0200, Georg Sauthoff wrote:
> On Friday 15 August 2003 17:41, Dominik Brodowski wrote:
> 
> Hi,
> 
> > On Fri, Aug 15, 2003 at 12:18:32PM +0200, Bas Mevissen wrote:
> 
> > > What is the best source for CPUFREQ for a 2.4.22-rc2 kernels? Is it the
> > > 2.4.22-rc2-ac1 kernel version or the 2.4 tarballs on
> > > ftp://ftp.linux.org.uk/pub/linux/cpufreq/ or the LINUX_2_4 tag from CVS?
> 
> > Either 2.4.22-rc2-ac1 or the latest 2.4 backport on www.codemonkey.org.uk -
> > but as that's offline at the moment, I'd try -ac. Or 2.6.0-test3-bk-current
> >
> > :)
> 
> unfortunely I can't use -ac 2.4. Kernels ... (because of my hardware and not 
> 2.6. because of a Cisco VPN). Is (or was) www.codemonkey.org.uk really the 
> only place, to get the cpufreq backports against vanilla 2.4. kernels?

Yes.

> What about cvs? And the ftp location mentioned by Bas Mevissen is outdated?

The ftp location takes the latest cvs sources. And the CVS sources aren't
kept up to date for the 2.4. backports.

	Dominik
