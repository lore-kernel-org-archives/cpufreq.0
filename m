From: Wes Felter <wesley@felter.org>
Subject: Re: about p-state on xeon processors
Date: Tue, 21 Aug 2007 18:10:24 -0500
Message-ID: <fafrv8$975$1@sea.gmane.org>
References: <449932.83753.qm@web39712.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <449932.83753.qm@web39712.mail.mud.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

M C wrote:
> Hi. Who knows how many p-states the xeon 5000 processors have. I have searched a lot on the intel website, but I cannot find anything about it. Could you please give me some guidance on how to find it? Thanks.

The public manuals do not contain this information. Assuming you have 
cpufreq working, just cat 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies.

Wes Felter - wesley@felter.org
