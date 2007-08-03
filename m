From: Len Brown <lenb@kernel.org>
Subject: Re: do Pentium4 & PentiumM consume about the same at their lowest
	possible freq?
Date: Fri, 3 Aug 2007 14:16:58 -0400
Message-ID: <200708031416.58746.lenb@kernel.org>
References: <46B35E55.6080705@unica.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46B35E55.6080705@unica.it>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk

On Friday 03 August 2007 12:56, Roberto De Leo wrote:
> Hi all,
> I am not sure this is the right place where posing my question, if not 
> please suggest me a better one!
> 
> I come to the question.
> I happily used the speedstep kernel module with my centrino laptop and 
> it really made a difference in terms of battery duration (actually now I 
> have a celeron-m based laptop and the difference does not seem so 
> evident, but I still have little statistic on it).
> Now I need to replace my main home 'desktop' PC and I am tempted to buy 
> a PentiumM-based minit-itx MB (e.g. the AOpen i945GTt-VFA) in order to 
> decrease the power bill (my PC is on 24/7), but since mini-itx MBs are 
> quite expensive I'd prefer first to know the following: can the  "Intel 
> Pentium 4 clock modulation" kernel module (or maybe the "AMD 
> Opteron/Athlon64 PowerNow!" one) bring the corresponding CPUs to consume 
> as little as the "Intel Enhanced SpeedStep" does for a centrino? This 
> info is quite important but I could not find it anywhere!

In general, no -- you are better off with a mobile-optimized processor.

indeed, under many conditions, using pentium 4 clock modulation will
actually increase energy use, rather than decrease it.

-Len
