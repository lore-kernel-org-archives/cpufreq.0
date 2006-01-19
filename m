From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [RFC] cpufrequtils-0.5-rc1
Date: Thu, 19 Jan 2006 15:42:31 +0100
Message-ID: <20060119144231.GG2154@poupinou.org>
References: <20060117203643.GB16217@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060117203643.GB16217@isilmar.linta.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

On Tue, Jan 17, 2006 at 09:36:43PM +0100, Dominik Brodowski wrote:
> Hi,
> 
> At
> http://kernel.org/pub/linux/kernel/people/brodo/cpufrequtils-0.5-pre1.tar.bz2
> you can find a new prerelease version of cpufrequtils. Most important is
> that the package size was reduzed by a factor of 11, only caused by a switch
> away from autotools to a customized Makefile based on the one to be found in
> udev. Also, compilation speed is down by a factor of 10 or so... I'm
> interested in your feedback on this, especially from package maintainers
> whether this complicates their life much, or if they have any (different)
> suggestions.
> 
> For configuration, please edit the "Makefile" found in the top directory.
> 
> Oh, and as the release numbering is a bit confusing -- was 0.3 really _that_
> unstable? -- I think I'll switch to the versioning system known by udev (and
> pcmciautils), which will mean that instead of cpufrequtils-0.5 it will be
> named cpufrequtils-1.
> 

BTW it would be fine to be able to install localized files ;)

--- Makefile	2006/01/19 14:36:17	1.2
+++ Makefile	2006/01/19 14:36:57
@@ -246,7 +246,7 @@ install-man:
 install-gmo:
 	$(INSTALL) -d $(DESTDIR)${prefix}${localedir}
 	for HLANG in $(LANGUAGES); do \
-		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo;' \
+		echo '$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo'; \
 		$(INSTALL_DATA) -D po/$$HLANG.gmo $(DESTDIR)${prefix}${localedir}/$$HLANG/LC_MESSAGES/cpufrequtils.mo; \
 	done;
 

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
