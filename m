From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Sun, 2 Jan 2005 13:07:29 +0100
Message-ID: <20050102120729.GB23300@dominikbrodowski.de>
References: <20041230014005.GA16358@bittwiddlers.com>
	<1104446294.24179.1.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1104446294.24179.1.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>, Matthew Harrell <mharrell-dated-1104802810.0deb6f@bittwiddlers.com>

On Thu, Dec 30, 2004 at 02:38:14PM -0800, Jeremy Fitzhardinge wrote:
> On Wed, 2004-12-29 at 20:40 -0500, Matthew Harrell wrote:
> > Hi.  I get the following message so I figured I would send you an email
> > 
> >   speedstep-centrino: invalid ACPI data
> >   speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send /proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>
> > 
> > The cpu info file is attached.  Is there a simple change I can do to get this
> > to work on this laptop?
> 
> The "invalid ACPI data" suggests that a BIOS update might help.
> Unfortunately the driver can't do anything for an EST-enabled mobile P4
> without the ACPI data.
> 
> I don't know too much about ACPI, so I've cc:'d this to the cpufreq
> mailing list.

Can you make the disassembled DSDT (see http://acpi.sourceforge.net for
details and/or http://forums.gentoo.org/viewtopic.php?t=122145 for a howto;
proceed until step "7. Diagnosing a Buggy DSDT - Disassemble the DSDT"
please) as well as a full dmesg output available on the 'net somewhere, please?
If that's not possible, please send these two files off-list to me. 

Thanks,
	Dominik
