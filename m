From: Wes Felter <wesley@felter.org>
Subject: Re: do the clock throttling, not freq scaling
Date: Thu, 06 Sep 2007 15:49:35 -0500
Message-ID: <46E067DF.7090007@felter.org>
References: <901941.37012.qm@web39715.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <901941.37012.qm@web39715.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

M C wrote:
> Hi, everybody.
> 
> Who knows how to do clock throttling in linux on xeon or opteron processors? I want to change the clock duty-cycle(not the cpu frequency). Please give me some guidance. Thanks.

You probably don't want to do this, but on Xeon you can load the 
p4-clockmod driver.

What are you trying to accomplish?

Wes Felter - wesley@felter.org
