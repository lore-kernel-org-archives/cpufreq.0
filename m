From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: overrides
Date: Wed, 17 Mar 2004 21:00:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040317200051.GS28592@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1126A1BF@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C1126A1BF@txexmtae.amd.com>
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
Cc: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk, pavel@ucw.cz

On Wed, Mar 17, 2004 at 12:01:49PM -0600, paul.devriendt@amd.com wrote:
> > -----Original Message-----
> > From: Bruno Ducrot [mailto:ducrot@poupinou.org] 
> > Sent: Wednesday, March 17, 2004 10:04 AM
> > To: Pavel Machek
> > Cc: Dominik Brodowski; Cpufreq mailing list
> > Subject: Re: powernow-k8, more updates
> > 
> > Why not just provide an override from userspace?
> 
> The question of overrides is a difficult question. The
> theory is that BIOS provides a table of frequencies/
> voltages that should be used for this system. This is
> because different processors vary on the frequencies
> that they support, and different processors have
> different voltages for the same frequency. Also, the
> platform may have additional restrictions, such as the
> need to restrict operation at higher frequencies when
> running on battery power.

Then I think it's way better to kill all of this overriding stuff.

If people want to override, then they have to reimplemente that
by themself.

It's pretty easy by now to change that '#if 0' by '#if 1'...

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
