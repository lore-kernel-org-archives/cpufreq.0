From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Mon, 7 Jul 2003 15:32:40 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030707133240.GD7796@poupinou.org>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr> <20030706012114.GW7796@poupinou.org> <tpfzlih4si.fsf@helium.pps.jussieu.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <tpfzlih4si.fsf@helium.pps.jussieu.fr>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juliusz Chroboczek <jch@pps.jussieu.fr>
Cc: cpufreq@www.linux.org.uk, davej@suse.de

On Mon, Jul 07, 2003 at 02:58:37PM +0200, Juliusz Chroboczek wrote:
> >> Running stock 2.5.73 (ACPI + preempt) on a Compaq Presario 711, CPU is
> >> a 950MHz mobile Duron.  I'm getting unexpected timings when enabling
> >> cpufreq.
> 
> > There is a little bug in powernow-k7.c
> 
> > ducrot@neptune $  cvs diff -u -r1.42 powernow-k7.c
> 
> Yep, that did it.  Thanks a lot.
> 
> Why don't you push it into 2.5?

Well, I supposed it was in linus bk tree.  I will report then.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
