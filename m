From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Mon, 23 Aug 2004 17:46:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040823154633.GJ29560@poupinou.org>
References: <cg2jui$tba$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <cg2jui$tba$1@sea.gmane.org>
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
To: Ari Pollak <ajp@aripollak.com>
Cc: cpufreq@www.linux.org.uk

Hi,

On Thu, Aug 19, 2004 at 12:19:32PM -0400, Ari Pollak wrote:
> Hi there.. I'm trying to load the powernow-k8 module under kernel 
> 2.6.8.1 built for i386/Athlon64, but it won't load. I get the following 
> kernel messages instead:
> powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
> powernow-k8: Too many lo freq table entries

Here, the powernow-k8 driver complains there is too many low
frequencies.  This come from ACPI stuff in powernow-k8.

> powernow-k8: BIOS error: PSB table is not v1.4

Here, after falling back to the PSB/PST method, it complain about the
wrong version of the PSB table.

There is very likely a BIOS trouble, though I would expected that this
work after a patch from Paul?  Strange.  Could you please send me a
dump of teh ACPI tables, please, via:

wget ftp://ftp.kernel.org//pub/linux/kernel/people/lenb/acpi/utils/pmtools-20031210.tar.bz2
tar xjvfp pmtools-20031210.tar.bz2
cd pmtools-20031210/acpidmp
make
sudo ./acpidmp > acpidmp.out
bzip2 acpidmp.out 

Then could you mail me (privately) or better give us a link to this
acpidmp.out.bz2?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
