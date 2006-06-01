From: "Alexander Choporov" <alex_choporov@newmail.ru>
Subject: cpufreq-nforce2.c
Date: Thu, 1 Jun 2006 22:07:18 +0400
Message-ID: <002701c685a6$41290330$61d7ad0a@homeofalex>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: cpufreq@lists.linux.org.uk

Hi!

One fact: divider 1 dont work on nforce2 (at least on my motherboard Abit 
NF7S2), so we may change cpufreq-nforce2.c from

for (xdiv = 1; xdiv <= 0x80; xdiv++)

to

for (xdiv = 2; xdiv <= 0x80; xdiv++)

-- 
Alex 
