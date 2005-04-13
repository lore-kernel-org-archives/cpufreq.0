From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: longhaul
Date: Wed, 13 Apr 2005 16:54:20 +0200
Message-ID: <20050413145420.GT2298@poupinou.org>
References: <3EFE14A8A1A82D4BB867A48A01A88ED708A08A@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3EFE14A8A1A82D4BB867A48A01A88ED708A08A@waglmb01.labs.agilent.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ken_staton@agilent.com
Cc: cpufreq@lists.linux.org.uk

On Mon, Apr 11, 2005 at 10:46:56PM -0700, ken_staton@agilent.com wrote:
> 
> here's a partial fix for longhaul on a nehemiah c3-2.
> 
> the code in do_powersaver() is significantly changed.
> 
> frequency changes occur after the HLT instruction and there must
> be more than 20 usec between HLT and the interrupt that brings
> the cpu out of HLT. the only interrupt you have any chance of controlling
> is the timer interrupt.

BTW, what is the interrupt source in order to wakeup the processor in
this perticular case?  I would said SMI or SCI, but not
the timer one.  On the other hand I don't have hardware nor
specification so I cant tell for sure.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
