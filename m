From: David Moore <dcm@acm.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: 24 Jun 2003 14:47:52 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056491271.3979.15.camel@aldebaran.caltech.edu>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
	 <20030623133834.GA2330@brodo.de> <20030623161136.GG19556@poupinou.org>
	 <1056388336.15250.62.camel@ixodes.goop.org>
	 <1056398545.10322.111.camel@aldebaran.caltech.edu>
	 <20030623213726.GA1317@brodo.de>
	 <1056417280.10323.148.camel@aldebaran.caltech.edu>
	 <1056418635.5977.20.camel@sherkaner.pao.digeo.com>
	 <1056420149.10322.160.camel@aldebaran.caltech.edu>
	 <20030624091836.GI19556@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030624091836.GI19556@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Dominik Brodowski <linux@brodo.de>, Andrew Grover <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Tue, 2003-06-24 at 02:18, Ducrot Bruno wrote:
> Then only concern I may have for is still the _PDC method.  It is currently
> only documented in a MS document.  It is defined as an optional method
> used by the OS in order to be somehow compatible with older releases
> of Windows.  But it has the folowing:
> 
> Arguments:
> Arg0 (buffer):
> DWORD 0:         Revision Id
> DWORD 1:    Number of capabilities DWORDs in buffer
> DWORD 2-n:   Capabilities DWORDs, where each bit
> 	defines capabilities and features supported by the OSPM for
> 	processor power management.
> 	The definitions and meaning of each capabilities bit is vendor
> 	specific, and shared with OSPM by the vendor.
> 
> Result Code:
> None
> 
> Then give us now the correct values to be passed for Pentium-M found
> in Centrino platform, and I will be glad to do the break of cpufreq/acpi.c
> for you.
> 

Dword 0 should be 0x1
Dword 1 should be 0x1
Dword 2 should be 0x1

The 0x1 in Dword 2 indicates that the driver supports Enhanced
Speedstep.  In my DSDT, Dwords 0 and 1 are ignored anyway, but the
values above should be correct.

Feel free to do the split into two files if you think that's the way to
go.  I'm going to submit my patch to the cpufreq list anyway under a
separate email, just so it exists for the record.  You might change your
mind after seeing it.  I also have a patch that fixes a few bugs in the
current cpufreq/acpi.c.

Regards,

David
