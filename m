From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: supported x86 processors?
Date: Mon, 1 Mar 2004 16:58:17 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040301155817.GV2869@poupinou.org>
References: <200402292003.i1TK3VKw012139@localhost.localdomain>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200402292003.i1TK3VKw012139@localhost.localdomain>
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
To: Franco <net.surfer@tiscali.it>
Cc: cpufreq@www.linux.org.uk

On Sun, Feb 29, 2004 at 09:03:30PM +0100, Franco wrote:
> Hello,
> 
> could you tell me which x86 processors are well
> supported by cpufreq, or are likely to be in a 
> near future?
> 
> I've already read Documentation/cpu-freq/user-guide.txt
> of my 2.6.3 kernel, but it doesn't say which are
> supported well and which aren't.
> 
> Sorry if this message is somehow a repetition,
> but I fear my previous message was a bit unclear,
> as I got no answers...
> 
> Thank You in advance,
> Franco
> 

For those I know the most, powernow are well supported (k6 and k8.
There are trouble to get for everyone documentations for the k7, at
least for me, but that one is now ok).
Speedstep are well supported also, but not on all hardware configurations.
If you have some VIA or SiS southbridges, this won't unlikely work.
On those systems, though, it may be possible to get it working with
the generic acpi io driver (not on all old PIII processors though, but
perhaps on recent PIIIs and P4m, no warranties, though).

For the others, I don't know but believe that all VIA C3 should be
OK (at least on near future).

Note that some driver do not support voltage scaling like the
p4-mod (clock modulation for the p4 in general) or the gx-suspmod
(geode family and clones) and then those processors should be avoided
for pure power managements applications.  You may take a look to
arch/i386/kernel/cpu/cpufreq/ for all the drivers currently supported.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
