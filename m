From: "Ralf Meyer" <ranfyy@gmail.com>
Subject: Mobile Celeron
Date: Mon, 12 Mar 2007 21:20:13 +0100
Message-ID: <50df9eb80703121320k182b0aa9x8fd7c6c7969384d7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=LtYcbGHJS/bJz5jhaiRzxMEbR/oOddnEcQPkwvQQGgrL+IbY5Kc9Wxt7te/IFfGLTFz7NPNlixHIZxWFNfa5i00hKBnqR81lcgCtAEE+2lDUHD5nl+GEPe6E2CeN9P/JZXzz8rPY6WviHfiiJavfo5FnmF/vc83rcjAJYWhHv/M=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi,

is a Mobile Celeron supposed to be able to do CPU frequency scaling?

$ cat /proc/cpuinfo
---
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 11
model name      : Mobile Intel(R) Celeron(TM) CPU          733MHz
stepping        : 4
cpu MHz         : 730.993
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 mmx fxsr sse up
bogomips        : 1463.43
---

Thanks for any pointers.
