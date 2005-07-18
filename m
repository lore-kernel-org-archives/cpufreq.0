From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Bios PST tables no more recognized after 2.6.8.1
Date: Mon, 18 Jul 2005 09:59:22 +0200
Message-ID: <20050718075922.GA2715@poupinou.org>
References: <20050711060227.10762.qmail@mail.supereva.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050711060227.10762.qmail@mail.supereva.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: beppuz@freemail.it
Cc: cpufreq@lists.linux.org.uk, "cpufreq@lists.linux.org.uk"@supereva.it

On Mon, Jul 11, 2005 at 06:02:27AM -0000, beppuz@freemail.it wrote:
> 
> Hi all,
> 
> 
> 
> I'm having a problem with my laptop (Acer Aspire 1356 LCi) whith an
> 
> Athlon M 2800+ CPU.
> 
> I installed kernel 2.6.x series since 2.6.3, and powernow has always run
> 
> smoothly. With kernels > 2.6.8.1 (the one I'm currently running) Bios
> 
> PST tables aren't recognized any more and even ACPI seems not to
> 
> handle correctly CPU frequencies.
> 

This is fixed in linux 2.6.12 compiled without SMP support.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
