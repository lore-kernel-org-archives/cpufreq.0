From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [BUG] wrong report of frequency in cpuinfo.
Date: Mon, 9 Feb 2004 16:22:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209152229.GB13262@poupinou.org>
References: <20040209150047.GZ13262@poupinou.org>
	<20040209151548.GA8306@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209151548.GA8306@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Mon, Feb 09, 2004 at 04:15:48PM +0100, Dominik Brodowski wrote:
> I cannot reproduce this with any of the speedstep-smi, acpi, p4-clockmod and
> speedstep-centrino drivers... so I tend to suspect powernow-k7?
> 

Found.  That because "pit" is the main clock here.

Well, I should consider to use TSC or ACPI for the system clock some
times :)

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
