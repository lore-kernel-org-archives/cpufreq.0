From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: speedstep-piix4 don't work
Date: Fri, 11 Jul 2003 17:48:59 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030711154859.GH22636@poupinou.org>
References: <3F0AED86.7040500@theorem.ca> <3F0BB1A5.7040606@theorem.ca> <20030709100834.GP7796@poupinou.org> <200307111711.14429.fm3@os.inf.tu-dresden.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200307111711.14429.fm3@os.inf.tu-dresden.de>
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
To: Frank Mehnert <fm3@os.inf.tu-dresden.de>
Cc: cpufreq@www.linux.org.uk

On Fri, Jul 11, 2003 at 05:11:09PM +0200, Frank Mehnert wrote:
Content-Description: signed data
> On Wednesday 09 July 2003 12:08, Ducrot Bruno wrote:
> > Ok.  Could you remove the lines:
> >     145         /* We may have to define a 'good' throttling duty ? */
> >     146         pcntrl &= ~(0x7 << 1);
> >     147         pcntrl |= (0x3 << 1);
> >     148
> >
> > That will done exactly the same stuff as the old independant kernel module.
> > If that still do not work, well I will be a little puzzled then, but give
> > me still dmesg in any case.
> 
> I'm a different user than the original one which opened this thread.

Please test attached patch.  (Shame on me).

Index: speedstep-piix4.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-piix4.c,v
retrieving revision 1.6
diff -u -r1.6 speedstep-piix4.c
--- speedstep-piix4.c	11 Jul 2003 13:11:15 -0000	1.6
+++ speedstep-piix4.c	11 Jul 2003 15:43:05 -0000
@@ -124,8 +124,9 @@
 	value = inb_p(pmbase + gpo_hilo_port);
 
 	/* compute new state */
-	value &= ~(1 << gpo_hilo_shift);
-	value |= state << gpo_hilo_shift;
+	value = state ? (value | (1 << gpo_hilo_shift)) : \
+		        (value & ~(1 << gpo_hilo_shift));
+
 
 	/* disable bus master arbitration */
 	pm2_blk = inb(0x22);


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
