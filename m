From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: Thu, 26 Jun 2003 12:40:41 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030626104041.GR19556@poupinou.org>
References: <20030623133834.GA2330@brodo.de> <20030623161136.GG19556@poupinou.org> <1056388336.15250.62.camel@ixodes.goop.org> <1056398545.10322.111.camel@aldebaran.caltech.edu> <20030623213726.GA1317@brodo.de> <1056417280.10323.148.camel@aldebaran.caltech.edu> <1056418635.5977.20.camel@sherkaner.pao.digeo.com> <1056420149.10322.160.camel@aldebaran.caltech.edu> <20030624091836.GI19556@poupinou.org> <1056491271.3979.15.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1056491271.3979.15.camel@aldebaran.caltech.edu>
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
To: David Moore <dcm@acm.org>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Dominik Brodowski <linux@brodo.de>, Andrew Grover <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Tue, Jun 24, 2003 at 02:47:52PM -0700, David Moore wrote:
> On Tue, 2003-06-24 at 02:18, Ducrot Bruno wrote:
> > Then only concern I may have for is still the _PDC method.  It is currently
> > only documented in a MS document.  It is defined as an optional method
> > used by the OS in order to be somehow compatible with older releases
> > of Windows.  But it has the folowing:
> > 
> > Arguments:
> > Arg0 (buffer):
> > DWORD 0:         Revision Id
> > DWORD 1:    Number of capabilities DWORDs in buffer
> > DWORD 2-n:   Capabilities DWORDs, where each bit
> > 	defines capabilities and features supported by the OSPM for
> > 	processor power management.
> > 	The definitions and meaning of each capabilities bit is vendor
> > 	specific, and shared with OSPM by the vendor.
> > 
> > Result Code:
> > None
> > 
> > Then give us now the correct values to be passed for Pentium-M found
> > in Centrino platform, and I will be glad to do the break of cpufreq/acpi.c
> > for you.
> > 
> 
> Dword 0 should be 0x1
> Dword 1 should be 0x1
> Dword 2 should be 0x1
> 
> The 0x1 in Dword 2 indicates that the driver supports Enhanced
> Speedstep.  In my DSDT, Dwords 0 and 1 are ignored anyway, but the
> values above should be correct.

Sound like ok, but not for Dword 0.  Will look more at it then.

> 
> Feel free to do the split into two files if you think that's the way to
> go.  I'm going to submit my patch to the cpufreq list anyway under a
> separate email, just so it exists for the record.  You might change your
> mind after seeing it.  I also have a patch that fixes a few bugs in the
> current cpufreq/acpi.c.

Yes, I saw some of those bugs too.  Will look at it a little bit more.

Note that I am not really against at, but I prefer to see at first all
implications of supporting this method.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
