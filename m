From: Dave Jones <davej@redhat.com>
Subject: Re: writing a frequency scaling processor module
Date: Mon, 24 Sep 2007 19:31:35 -0400
Message-ID: <20070924233135.GK8127@redhat.com>
References: <556445368AFA1C438794ABDA8901891C066B5BD9@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <556445368AFA1C438794ABDA8901891C066B5BD9@USA0300MS03.na.xerox.net>
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
To: "Leisner, Martin" <Martin.Leisner@xerox.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Sep 07, 2007 at 01:04:51PM -0400, Leisner, Martin wrote:
 > I'm writing a cpufreq module for the ppc 7448 processor.
 > 
 > Its very nice the way cpufreq is laid out with the governors...is there
 > a 
 > "cookbook" approach to writing a processor interface?

Not really. Rumour has it that kernel programmers hate writing
documentation ;^)

 > I looked at cpu-drivers.txt in the kernel tree, and it's somewhat vague
 > and confusing (IMHO).
 > 
 > I'm using p4-clocmod.c as an example, are there better examples?
 
that, longhaul and powernow-k7 are fairly simple to understand.
Is there anything in particular you have problems understanding ?

	Dave

-- 
http://www.codemonkey.org.uk
