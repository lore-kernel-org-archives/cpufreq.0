From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 11:22:01 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <3F6ACAB9.90204@basmevissen.nl>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>	<3F6ABD35.9070104@basmevissen.nl>
	<20030919083610.GB732@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20030919083610.GB732@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dongili@supereva.it
Cc: cpufreq@www.linux.org.uk

Mattia Dongili wrote:

> 
> AFAIK powersave statically sets the cpu at the minimum allowed (0% in
> OP's case), while performance sets to the maximum allowed.
> 

Ah, you are right. It's documented at 
<http://cvs.arm.linux.org.uk/cgi/viewcvs.cgi/cpufreq/linux/Documentation/cpufreq/governors.txt?rev=1.1&only_with_tag=LINUX_2_4&content-type=text/vnd.viewcvs-markup>

Bas.
