From: Marc Singer <elf@buici.com>
Subject: Re: Athlon 64 complains of frequency mismatch
Date: Wed, 23 Jun 2004 00:54:18 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040623075418.GA5213@buici.com>
References: <84EA05E2CA77634C82730353CBE3A8432698C5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8432698C5@SAUSEXMB1.amd.com>
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
Cc: cpufreq@www.linux.org.uk

On Wed, Jun 23, 2004 at 12:43:51AM -0700, paul.devriendt@amd.com wrote:
> > Perhaps this is an addition to the FAQ:
> > 
> >  Q609: AMD Cool&Quiet CPU won't load the powernow-k? driver.  Why?
> > 
> >  A609: The powernow driver gets it's information about processor
> >        states from the BIOS's reported ACPI control data.  If the
> >        powernow driver won't load it may be because Cool&Quiet hasn't
> >        been enabled in the BIOS.  Make sure that BIOS settings for a
> >        PowerNow or a Cool&Quiet option are enabled.
> > 
> > Or, maybe the driver should output a kernel message about BIOS
> > settings.
> 
> Where is the FAQ ? I would like to read it :)
> 
> How about having the driver put out a message referring to go 
> read the FAQ ?

Hmm.  It's hard to read your response.  If you are being sarcastic
then perhaps I need to be more explicit.

--- linux/Documentation/cpu-freq/user-guide.txt_orig	2004-06-23 00:51:46.000000000 -0700
+++ linux/Documentation/cpu-freq/user-guide.txt	2004-06-23 00:52:35.000000000 -0700
@@ -71,6 +71,14 @@
 [*] Only if "ACPI Processor Performance States" are available
 to the ACPI<->BIOS interface.
 
+ Q: AMD Cool&Quiet CPU won't load the powernow-k? driver.  Why?
+
+ A: The powernow driver gets it's information about processor
+    states from the BIOS's reported ACPI control data.  If the
+    powernow driver won't load it may be because Cool&Quiet hasn't
+    been enabled in the BIOS.  Make sure that BIOS settings for a
+    PowerNow or a Cool&Quiet option are enabled.
+
 
 1.3 sparc64
 -----------
