From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Support for Mobile Athlon XP - M ?
Date: Mon, 20 Jun 2005 17:09:30 +0200
Message-ID: <20050620150930.GB8899@poupinou.org>
References: <42B53453.2020304@gmx.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <42B53453.2020304@gmx.net>
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
To: Felix Krull <kilmarnock@gmx.net>
Cc: cpufreq@lists.linux.org.uk

On Sun, Jun 19, 2005 at 11:01:07AM +0200, Felix Krull wrote:
> Hi!
> 
> I modified my Athlon XP (Barton core) to be a mobile XP - M by bridging 
> some open bridges according to http://fab51.com/cpu/barton/athlon-e24.html .
> I booted my old Win installation and checked the success with 
> CrystalCPUID. x86info mentions the cpu to be PowerNow capable:
> 
> PowerNOW! Technology information
> Available features:
>         Temperature sensing diode present.
>         Bus divisor control
>         Voltage ID control
> 
> But unfortunatelly cpufreq does not seem to support my XP-M. I am not 
> able to load the module powernow-k7 into the kernel. There is no entry 
> for cpufreq under the /sys tree.
> 
> Is there a way to get cpufreq working with this upgraded cpu or will I 
> have to downgrade my installation to win in order to slow down my cpu?
> 

powernow-k7 use some BIOS table(s) in order to retrieve supported
frequencies.  Your BIOS do not generate them.  Thus powernow-k7 will
fail.

In order to get it working, you have to add such information directly
to the driver.  There should be some patches around this mailing-list
to this end.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
