From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: userspace not supported for longrun?
Date: Wed, 2 Jun 2004 14:40:55 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602124055.GA9210@dominikbrodowski.de>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wayne Wylupski <wayne@connact.com>
Cc: cpufreq@www.linux.org.uk

To clarify some things:

On Mon, May 31, 2004 at 11:40:26PM -0400, Wayne Wylupski wrote:
> I've been tracking down an issue with using Fedora Core 2 on a 
> Transmeta Crusoe TM5800 and it appears a userspace governor is not 
> supported by cpufreq (the longrun scaling driver has a .setpolicy, 
> which prevents the userspace governor from being set).

.setpolicy drivers prevent _all_ governors from being set. They don't need
governors, as they are set to a 
- frequency range
and a - policy , e.g. a in-hardware [or microcode] algorithm which decides
on what speed the CPU should run at within the range specified above.

> Could someone please explain if this is by choice or a bug?  If it's 
> the latter, could someone explain why, since the CPU itself supports 
> different frequencies?
... and the CPU switches between these different frequencies itself, as long
as they are within the frequency range.

	Dominik
