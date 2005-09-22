From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow failure
Date: Thu, 22 Sep 2005 16:43:05 +0200
Message-ID: <20050922144305.GD12885@poupinou.org>
References: <F7DC2337C7631D4386A2DF6E8FB22B3004AA5BE3@hdsmsx401.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <F7DC2337C7631D4386A2DF6E8FB22B3004AA5BE3@hdsmsx401.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Brown, Len" <len.brown@intel.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 21, 2005 at 09:56:45PM -0400, Brown, Len wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=5266
> 
> unclear if this bug filed agasinst ACPI is an ACPI issue,
> do any guys who are not on the powernow driver want to take a look?
> 

It's seems it's an issue I introduced trying to fix another one, but I
believe it's not actually my fault.  The powernow-k7 driver now
calibrate in order to get it right with max and such.  I believe that
in some case the system clock run twice (well, at least I saw reports
on this on nforce based systems IIRC) and therefore I think it's what
need to be fixed.

Read: I won't fix that and I don't think it is related to ACPI
nor CPUFreq but to timer code.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
