From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 13:23:22 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414122321.GH24970@redhat.com>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414121857.GC8953@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:
 > Already?  Thanks!
 > I actually wanted to submit also the ACPI integration...

Ok, I'll look at folding that in too after lunch.
 
 > Warning: it will only half work on the ACER Aspire, though: there is
 > no pstate in the DSDT corresponding to the max frequency...
 > I'm looking how to handle that correctly, probably at the init stage,
 > if the max frequency is not given, then add it to powernow_table.  It's
 > really ugly, but I don't know how to make that OK.
 > Suggestion is of course welcome..

Blacklist its BIOS with DMI tables, and adjust accordingly?
Is it fixed maybe in a BIOS update ?

 > * Integrate acpi perflib from Dominik.
 > * Use acpi if the PST tables are known to be broken (ASUS Aspire match one PST,
 >   but give brain damaged values), or use ACPI if no PST found.

Was that the one that had every entry exactly the same ?

		Dave
