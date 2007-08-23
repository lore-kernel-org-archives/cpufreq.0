From: Dave Jones <davej@redhat.com>
Subject: Re: about cpufreq on intel dual core processor
Date: Wed, 22 Aug 2007 20:18:15 -0400
Message-ID: <20070823001815.GD18739@redhat.com>
References: <193428.18959.qm@web39710.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <193428.18959.qm@web39710.mail.mud.yahoo.com>
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
To: M C <kingming0811@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On Sat, Aug 18, 2007 at 07:54:01AM -0700, M C wrote:
 > Hi, I have a simple question about cpufreq on intel dualcore processor.
 > 
 > if each core has six frequency levels, then should i change the frequency levels for both of the cores simultaneously or i can change them separately?
 > 
 > because the processor supports hyper threading techonogy, so there are fours cores in the linux system. then how should i treat the four cpu when i want to do the frequency scaling?

You are able to set different frequencies per core, however you only
save power per-socket, so unless they're all ramped down, you won't
be lowering the voltage of the socket if one core keeps the package busy.

	Dave

-- 
http://www.codemonkey.org.uk
