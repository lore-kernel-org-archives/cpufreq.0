From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 20:40:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402184003.GQ19001@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C11E36B33@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C11E36B33@txexmtae.amd.com>
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
To: paul.devriendt@amd.com
Cc: akpm@osdl.org, mark.langsdorf@amd.com, cpufreq@www.linux.org.uk, pavel@ucw.cz, davej@redhat.com, linux@dominikbrodowski.de

On Fri, Apr 02, 2004 at 10:59:05AM -0600, paul.devriendt@amd.com wrote:
> > But I can't say for sure which have to be favored: legacy or ACPI.
> > I don't have enough dump of ACPI tables and PSB/PST from 
> > machines shipped
> > with AMD64.
> > 
> > Bruno Ducrot
> 
> ACPI please ....
> 
> 1. It seems that system manufacturers are testing with Windows XP
> only before shipping their machines. Windows XP uses ACPI, so that
> is the mechanism that is most likely to have accurate pstate data.
> 2. We are seeing a lot of broken PSB/PSTs.
> 3. The PSB/PST does not support SMP in its current form. ACPI does.
> 4. Current plan is to not have PSB/PST at all for future processors.
> 5. You need the ACPI support for the _PPC object which gives battery
> and thermal control.
> 
> The downside to making the ACPI favored is that it is newer. But,
> given the PSB/PST breakages from bad BIOS data, the newer is going
> to be more robust.
> 

I totally agree with you.  The only problem I see is that it's
possible that AML is so broken that it's not possible to make it
work under Linux without changing a lot of things in the current ACPI
interpreter, and that may be hard to get those changes by ACPI linux
gang.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
