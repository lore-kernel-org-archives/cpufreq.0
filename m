From: "Miroslav Vasic" <miroslav.vasic@gmail.com>
Subject: Few questions
Date: Wed, 26 Apr 2006 10:04:57 +0200
Message-ID: <b6cb966c0604260104o3ff71374o6e676668b9956fc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

Hello, everyone!

My name is Miroslav Vasic and I am PhD student on faculty of
Electrical Engineering, University of Politecnica in Madrid. One part of th=
e
project I am working on, as a part of my PhD thesis, is related with
frequency and voltage changing of microprocessors. For that purpose, my
group has bought Viper board with Intel's XScale PXA255 processor. Operatin=
g
system which is used for that board is Arcom Embedded Linux, based on Linux
kernel version 2.6. With documentation we got source code of kernel. In
those files some documents which have been written by Mr. Brodowski can be
found, so I believe that people from this mailing list can help me to
clarify some things. I would like to apologize in advance, because I believ=
e
I am asking you some things which are very basic and simple, but my field o=
f
interest is power electronics, not computer programming, so I have lot of
doubts.

 1. In the document user-guide.txt, the second paragraph
"Policy"/"Governor"?, is discussed about solutions about frequency changing=
.
Later, in other txt files (Governors.txt, core.txt...) I saw that there
is relation between the Governor for my board and the Policy. Furthermore,
 cpufreq_driver is mentioned. I do not understand hierarchy of
these components. As much as I understand now, cpufreq_driver is some kind
of  interface to change CPU clock, Governor is the part which makes decison
when to change clock, and Policy is part where I need to define min and
max frequency, right?

 2. I was trying to understand what was done in the cpufreq.c but I
couldn't. I have lot of doubts how to make a Governor for my system. Do you
have any example where I can see that?

 3. I have tried to control clock with a present interface, from the
userspace, changing the values in some files
(scaling_setspeed, scaling_min/max_frequency). With command cpufreq-info I
saw that it was possible to do this, but I am afraid that this command only
reads values from these files, and that values were not change. Can you
confirm me this?

 4. If I can change clock values through the file scaling_setspeed, then
I need to make a periodic task which will make decision when and how to
change clock values, right? There is no need to write new cpufreq_driver,
Governer or whatever else, isn't it?

 5. If the clock changes are possible through scaling_setspeed file, how
long does it take to change it? I mean, does it change immediately or it
takes time that some periodic process first read new value, and then to
change clock speed?

These are the most important doubts and questions I have right now. Once
again, I am very sorry for disturbing you, but I need a little help and som=
e
explanations. If you don't have time to answer me, please send me some
examples where is cpu frequency control realized, in order to have
better picture about the system I need to make. Right now, I feel little
lost in the great number of new information I need to understand.

 Thanks and best regards,

 Miroslav Vasic
