From: Pavel Machek <pavel@ucw.cz>
Subject: Re: powernow-k8, more updates
Date: Wed, 17 Mar 2004 20:50:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040317195015.GA287@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C1126A014@txexmtae.amd.com>
	<20040317100745.GA15284@dominikbrodowski.de>
	<20040317120409.GA482@elf.ucw.cz>
	<20040317124432.GA7426@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040317124432.GA7426@dominikbrodowski.de>
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
To: paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

> On Wed, Mar 17, 2004 at 01:04:09PM +0100, Pavel Machek wrote:
> > - *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
> > + *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs
> 
> either I'm blind or stupid... what's the difference here?

Blind. Original email address has .ork. in it.

> > +		printk(KERN_INFO PFX "   %d : fid %x (%d MHz), vid %x\n", j,
> > +		       pst[j].fid, powernow_table[j].frequency/1000, pst[j].vid);
> 
> > +
> > +	printk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);
> 
> can we change this to dprintk, please? It avoids some noise....

I agree about the second one. I thought that list of frequencies in
MHz is probably important enough?

> Other than that, patch looks good to me

Should I edit it and resend?
								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
