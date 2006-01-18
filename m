From: Mattia Dongili <malattia@linux.it>
Subject: Re: [RFC] cpufrequtils-0.5-rc1
Date: Wed, 18 Jan 2006 21:46:10 +0100
Message-ID: <20060118204610.GC3628@inferi.kami.home>
References: <20060117203643.GB16217@isilmar.linta.de>
	<20060118203528.GA3628@inferi.kami.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060118203528.GA3628@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2006 at 09:35:28PM +0100, Mattia Dongili wrote:
[...]
> The attached patch...

Ooops... here it is.

-- 
mattia
:wq!

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="command_line_configurable_options.diff"

--- cpufrequtils-0.5-pre1.clean/Makefile	2006-01-13 14:33:27.000000000 +0100
+++ cpufrequtils-0.5-pre1/Makefile	2006-01-18 21:32:04.065589499 +0100
@@ -24,24 +24,24 @@
 
 # Set the following to `true' to make a unstripped, unoptimized
 # binary. Leave this set to `false' for production use.
-DEBUG =		false
+DEBUG ?=	false
 
 # make the build silent. Set this to something else to make it noisy again.
-V =		false
+V ?=		false
 
 # Internationalization support (output in different languages).
 # Requires gettext.
-NLS =		true
+NLS ?=		true
 
 # Use the sysfs-based interface which is included in all 2.6 kernels
 # built with cpufreq support
-SYSFS =		true
+SYSFS ?=	true
 
 # Use the proc-based interface which is used in the 2.4 patch for cpufreq
-PROC =		true
+PROC ?=		true
 
 # Prefix to the directories we're installing to
-DESTDIR =	/usr
+DESTDIR ?=	/usr
 
 # --- CONFIGURATION END ---
 

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--vtzGhvizbBRQ85DL--

